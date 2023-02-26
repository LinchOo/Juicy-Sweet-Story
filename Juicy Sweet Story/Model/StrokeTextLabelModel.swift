
import SwiftUI

struct StrokeTextLabel: UIViewRepresentable {
    var text: String
    var size: CGFloat
	
    func makeUIView(context: Context) -> UILabel {
        let strokeLabel = UILabel(frame: CGRect.zero)
        let gradientImage = UIImage(named: "gradient2")!
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = NSTextAlignment.center
        attributedStringParagraphStyle.lineBreakMode = .byWordWrapping
        
       
        let attributedString = NSAttributedString(
            string: text,
            attributes:[
                NSAttributedString.Key.paragraphStyle: attributedStringParagraphStyle,
                NSAttributedString.Key.strokeWidth: -12,
                NSAttributedString.Key.foregroundColor: UIColor.clear,
                NSAttributedString.Key.strokeColor: UIColor.init(patternImage: gradientImage),
                NSAttributedString.Key.font: UIFont(name:"Knewave-Regular", size:size)!
            ]
        )
        
		let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        strokeLabel.attributedText = attributedString
		strokeLabel.numberOfLines = 2
        strokeLabel.backgroundColor = UIColor.clear
        strokeLabel.center = CGPoint.init(x: 0.0, y: 0.0)
		updateUIView(strokeLabel, context: context)
        return strokeLabel
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
		
	}
}
