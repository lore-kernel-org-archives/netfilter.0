From: Jason Opperisano <opie@817west.com>
Subject: Re: Transparent Proxy to a Remote Squid Box
Date: Fri, 19 Nov 2004 12:11:02 -0500
Message-ID: <20041119171102.GA20751@bender.817west.com>
References: <419E1644.1030903@phreaker.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <419E1644.1030903@phreaker.net>
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

On Fri, Nov 19, 2004 at 11:50:28PM +0800, ro0ot wrote:
> I am running the below scripts for "Transparent Proxy to a Remote Squid 
> Box": -
> 
> $IPTABLES -t nat -A PREROUTING -i $cusif -s ! $squid_box -p tcp --dport 
> 80 -j DNAT --to $squid_box:3128
> $IPTABLES -t nat -A POSTROUTING -o $cusif -s $cus_net -d $squid_box -j 
> SNAT --to $cus_ip
> $IPTABLES -A FORWARD -s $eastin_i001 -d $squid_box -i $cusif -o $cusif 
> -p tcp --dport 3128 -j ACCEPT
> 
> If the daemon dies, I need to remove the above three lines.  How can I 
> monitor the Squid daemon from the firewall? 

i do not see how this is at all relevant to a netfilter mailing list.

that being said--there are infinite ways for you to do this--the 10
second response is:

setup shared SSH keys between the firewall and the squid box.

on the firewall, run a cron job that checks for the squid process on the
remote machine:

---begin script---
alive=`ssh $SQUIDHOST "if pgrep squid > /dev/null; then echo 1;else echo 0;
fi"`

if [ $alive -eq 0 ]; then
  iptables -D [ ... ]
fi
---end script---

since this is completely OT--i'm not really looking for comments on the
lameness of the above...  :-D

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
        --The Simpsons

