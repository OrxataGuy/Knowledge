/**
	Function based on the original function proposed in the answer to the question https://stackoverflow.com/questions/18474497/replace-text-in-a-website
	All credit for this feature and its authorship goes to the author of the post.
*/
function replaceTextOnWebPage(original, replacement) 
{
	const textNodes = () => {
		const nodes = []
		(function scan(node) {
			if (node.childNodes.length) 
				for (let idx = 0; idx < node.childNodes.length; idx++) scan(node.childNodes[idx])
			else if (node.nodeType === Node.TEXT_NODE) nodes.push(node)
		})(document)
		return nodes
	}, quote = str => (new String(str).valueOf()).replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1");
	textNodes().forEach(node => node.nodeValue = node.nodeValue.replace(new RegExp(quote(original), 'g'), replacement));
}
