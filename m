From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: Spoofed ip's
Date: Wed, 12 Feb 2003 08:56:11 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0e1701c2d274$972e04d0$eb00010a@andromeda>
References: <1044948351.23287.11.camel@filth.sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

deff wrote, Tuesday, February 11, 2003 7:25 AM:
[...]
> Then i took a look at Firestarter's iptables script and saw that
> it also filters out other addresses.

> Could anyone please check the rules below and tell me if the
> the source ip'ss are valid. I'm seeing an incredible amount of
> these ip's attempting to get through .

> To me it looks like i'm blocking out the whole internet, but that
> makes me wonder why firestarter does it .

If you're going to bother doing this, at least do it properly. Don't use
someone else's list, as some of them are outdated and therefore, as in this
case, *wrong*.

At a quick glance, 69/8, 81/8, 82/8, 219/8, 220/8 and 221/8 are *not*
reserved. Some of them haven't been for nearly two years now.

http://www.iana.org/assignments/ipv4-address-space is the official
reference, which is kept up-to-date, and should be checked every so often
(alternatively, one could subscribe to the bogon announcement list).

Adam


