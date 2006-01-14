From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Bridge rule info?
Date: Sat, 14 Jan 2006 16:32:11 -0600
Message-ID: <200601141632.11569.rob0@gmx.co.uk>
References: <Pine.LNX.4.56.0601141648560.28674@pali.cps.cmich.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56.0601141648560.28674@pali.cps.cmich.edu>
Content-Disposition: inline
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

On Saturday 2006-January-14 15:53, Ishwar Rattan wrote:
> I have a debian based Linux box connected to dept LAN
> with iptables running. I am interested in eth0 and tun0
> bridge (br0) on this box.

Doublecheck that. I don't think a tun interface can participate in a 
bridge, because tun is TCP/IP, layer 3, whereas bridging occurs at 
layer 2, Ethernet. The same driver (tun) can provide tap (virtual 
Ethernet) devices as well.

> If I remove the firewall first and 
> then set up the bridge, it works as promised. If the firewall
> is brought up the bridge stops. So, I am looking for a
> way for bridge and firewall to work together.

Then you most likely are using rules which prevent the bridge from 
working! This is not a "smart question" (see the well-known catb.org 
link) because you have given us nothing to work with.

http://www.catb.org/~esr/faqs/smart-questions.html
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

