From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ftp conntrack - nat problem
Date: Tue, 8 Nov 2005 13:36:50 -0600
Message-ID: <200511081336.51769.rob0@gmx.co.uk>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
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

On Tuesday 2005-November-08 01:03, Dave Strydom wrote:
>     Active Help: http://www.smartftp.com/support/kb/index.php/74
>     Client closed the connection.
>     Transfer failed.
> ===
>
> And just dies there.
> Now if I use ACTIVE MODE (PORT) i get the same thing... my question
> is why?

I don't know. I'm not convinced it's a netfilter issue, though. I did 
not try to follow your script. Perhaps if you post your rules 
(iptables-save(8)) we could see if anything looks wrong. Please note 
that you didn't describe where you were sitting when you got this 
error, so we could not possibly guess what is happening. I imagine that 
this "smartftp" is some kind of Windows thing, so it probably was not 
running on the firewall?

> Here is a copy of my firewall script:

Did you write all this yourself?

> ### Accepting our servers OUTPUT RULES###
> $IPTABLES -A OUTPUT -p ALL -s $LOCAL_NETWORK_IP_RANGE -m state
> --state NEW,ESTABLISHED,RELATED -j ACCEPT

Above you had:
> $IPTABLES -P OUTPUT ACCEPT
so why are you adding ACCEPT rules to OUTPUT?

> ### Drop Rootshell Connections ###
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 1524 -j DROP

This is not appropriate in the nat table.

> ftp_conntrack and ip_nat_ftp is built into the kernel (from what i
> can tell) (kernel-2.6.11)

"From what [you] can tell?" You would know more about it than we would. 
Also, netfilter drivers really should not be built-in unless it's an 
embedded device which should reboot to make any changes.

> What am I missing, because this is seriously starting to annoy me,
> i cant find anything wrong,

Nor can I. It could be many things.

> even if i setup a simple DNAT for ftp, with no filtering or
> anything, it transfers a few files, and then bombs out

This suggests that the problem is not netfilter at all, but yes, more 
simple iptables rules would help in ruling it out.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

