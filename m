From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: pop3 and vpn
Date: Thu, 11 Aug 2005 12:22:10 -0500
Message-ID: <200508111222.10574.rob0@gmx.co.uk>
References: <9bc7d292050811035453e207c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9bc7d292050811035453e207c4@mail.gmail.com>
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

On Thursday 2005-August-11 05:54, Vinod H wrote:
> want to open pop3(110) port and We have Cisco VPN installed on our UK
> office and from here we are trying to connect to the VPN server
> [snip]
> I don't know if I want to open some port in the firewall so that my
> vpn works fine, following is my iptables

Find out from Cisco what port[s] and protocols are needed. I think 
Cisco's VPN uses GRE, so you'll need to ACCEPT that in FORWARD. GRE is 
protocol 47, "-p 47" or "-p gre" if that's in your /etc/protocols (it 
almost certainly is.)

Since you're asking these questions it is obvious that you didn't write 
that very complicated rule set you posted. I did not have time to look 
at it anyway. Find some other premade iptables script which will 
generate the rules you need, and ask your questions in a forum specific 
to that script. This list is for people who are wanting to learn how 
iptables / netfilter works.

If you are wanting to take the time to learn for yourself, get rid of 
that script. Secure and functional rules do not need to be so complex. 
See the Packet Filtering HOWTO and the NAT HOWTO.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

