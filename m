From: Jason Opperisano <opie@817west.com>
Subject: Re: How to SNAT FTP
Date: Mon, 11 Apr 2005 19:10:09 -0400
Message-ID: <20050411231009.GA24117@bender.817west.com>
References: <C55C2B2C46581A429D06FFBFD73008C601E7256B@CNTRRA20-XCS00.telkom.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <C55C2B2C46581A429D06FFBFD73008C601E7256B@CNTRRA20-XCS00.telkom.co.za>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Apr 11, 2005 at 08:26:39AM +0200, Daniel Fourie (DJN) wrote:
<--snip impressive ascii art-->
> I have got the following nat rules in my iptables firewall
> 
> $IPTABLES -t nat -A POSTROUTING -s $NET_DMZ -o eth0 \
> 
> -j SNAT --to-source 192.168.1.1
> 
> Everything seems to work fine, but ftp on the other hand is not
> working in active mode. The ftp helper is loaded (ip_conntrack_ftp,
> ip_nat_ftp).
> 
> If I do a network scan I can see the connection coming to my machine,
> but the data connection witch is negotiated in the payload is not
> natted to the correct ip (192.168.1.1). This is suggesting to me that
> the ftp helper is not working. I am running a updated version of
> RedHat 9 current kernel is kernel-2.4.20-31.9.
> 
> It will be appreciated if someone can help.

(1) are you running the FTP server on port 21 (the conntrack and nat
    helpers only track port 21 by default)

(2) do your firewall rules allow "--state RELATED" packets back through
    the FORWARD chain (from server -> client)?

(3) oh yeah--are you running an SSL-encrypted FTP server?

-j

--
"Protesters: Free Tibet! Free Tibet!
 Peter: I'll take it!
 Peter: Hello, China? I have something you may want. But it's gonna cost
 ya. That's right. All the tea."
        --Family Guy

