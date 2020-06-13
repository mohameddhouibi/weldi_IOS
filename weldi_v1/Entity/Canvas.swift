//
//  Canvas.swift
//  weldi_v1
//
//  Created by AmineGuesmi on 4/30/20.
//  Copyright © 2020 Dhouibi Muhamed. All rights reserved.
//

import UIKit


class Canvas: UIView {
    
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    func setStrokeWidth(width: Float)
    {
        self.strokeWidth = width
    }
    func setStrokeColor(color: UIColor)
    {
        self.strokeColor = color
    }
    
    func undo()
    {
        _ = lines.popLast()
    }
    func clear()
    {
        lines.removeAll()
        setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return  }
        
        
        
        lines.forEach { (line) in
            
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)

            for (i,p) in line.points.enumerated()
            {
                if i == 0
                {
                    context.move(to: p)
                }else
                {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
        
    }
    var lines = [Line]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let point = touches.first?.location(in: nil) else { return  }
        
        guard var lastLine = lines.popLast() else { return  }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
        
    }
    
}
