From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: tcp incomplete log
Date: Thu, 15 Jul 2004 18:54:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715235447.GA25403@valjean.si.ocslink.com>
References: <40F65927.80104@unav.es>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40F65927.80104@unav.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Jul 15, 2004 at 12:15:03PM +0200, Emilio Casbas wrote:
> I found curious log like this in my iptables log:
> 
> Jul 13 07:21:48 orfeo kernel: ICMP INPUT IN=eth0 OUT= 
> MAC=00:30:6e:36:5d:23:00:d0:95:4c:5c:d8:08:00 SRC=207.159.62.1 
> DST=my-server-ip LEN=56 TOS=0x00 PREC=0x00 TTL=236 ID=56340 PROTO=ICMP 
> TYPE=3 CODE=13 [SRC=my-server-ip DST=63.240.81.5 LEN=48 TOS=0x00 
> PREC=0x00 TTL=126 ID=58670 PROTO=TCP INCOMPLETE [8 bytes] ]
> 
> The server, is a squid proxy
> I have looking for this on previous post, but I am
> a bit confused.

Your squid proxy tried to connect to 63.240.81.5, but the connection
failed because the connection packet was filtered.

    Type    Name                       
    ----    -------------------------             
      3     Destination Unreachable
            Codes
               13  Communication Administratively Prohibited   

The ICMP error was returned by 207.159.62.1, which is a router or
firewall somewhere between your server and 63.240.81.5.

I believe the "INCOMPLETE" is netfilter's connection tracking system
telling you the TCP connection never completely opened.  This makes
sense, since your server probably only sent the initial SYN before
receiving the ICMP error (instead of the expected SYN+ACK).

-James


