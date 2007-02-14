From: Sebastien Tricaud <sebastien.tricaud@wengo.com>
Subject: ruby iptables network displayer
Date: Wed, 14 Feb 2007 11:58:33 +0100
Message-ID: <45D2EB59.1040905@wengo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,

I wrote a simple tool parsing "iptables-save" output in order to produce
a svg image.
It is still in early age, however it works for my own purposes.

There is a color scheme where green means accept, red drop and blue
queue. The state connection tracking is very basic but makes you
understand the netflow authorized. And the interface is colorized
according to its default policy. Chains jumps aren't recognized yet.

Feel free to give feedback, positive and/or negative to make this tool
better.

Url: http://freshmeat.net/projects/ruined/
MD5 for security addicts : 128ca4ad8eefbf50ab968447dc5818fb 
ruined-0.6.tar.gz


Thanks,
Sebastien.



