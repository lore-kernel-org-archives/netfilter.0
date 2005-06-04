From: Jason Opperisano <opie@817west.com>
Subject: Re: 1:1 nat not working;
Date: Sat, 4 Jun 2005 16:59:59 -0400
Message-ID: <20050604205959.GA20903@bender.817west.com>
References: <Pine.LNX.4.60.0506041550330.2474@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0506041550330.2474@darkstar.sysinfo.com>
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

On Sat, Jun 04, 2005 at 04:04:18PM -0400, R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
> Okay, I need help getting this working, I've wasted too much time on it 
> and can't get it functional.
> 
> address mappings in /etc/hosts ;
> 
> # IP Block:  public-IP.16/28
> # usable IPs are public-IP.18 - public-IP.30
> # base subnet   public-IP.16
> # broadcast address  public-IP.31
> # subnet mask 255.255.255.240

and you've added the IP's .18 - .30 as aliases on your external
interface of your firewall machine with:

  for i in `seq 18 30`; do
    ip addr add x.y.z.${i} dev ${EXT_IF}
  done

right?

as an aside, you could reduce the number of rules you have by using
NETMAP and a bit of auto-summarization:

  x.y.z.18/31
  x.y.z.20/30
  x.y.z.24/30
  x.y.z.28/31
  x.y.z.30/32

  iptables -t nat -A PREROUTING -d x.y.z.18/31 \
    -j NETMAP --to 192.168.80.18/31
  iptables -t nat -A POSTROUTING -s 192.168.80.18/31 \
    -j NETMAP --to x.y.z.18/31

  etc...

-j

--
"Jennifer Love Hewitt: "I Know What You Did Last Summer"?
 Peter: Nope... never heard of it.
 Jennifer Love Hewitt: "The Devil and Daniel Webster"?
 Peter: No.
 Jennifer Love Hewitt: "Party of Five"?
 Peter: Was that a porno?"
        --Family Guy

