From: "hard__ware" <hard__ware@hotmail.com>
Subject: (no subject)
Date: Mon, 30 Sep 2002 16:38:20 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE30Wf4byn8rkR1TH8G00004d3f@hotmail.com>
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
To: talora-listas@talora.com.br
Cc: netfilter@lists.netfilter.org

Hello,

Talora Wrote:

>I've just downloaded, compiled and installed kernel 2.4.19 from
>kernel.org on a RedHat 7.3 system. I've reviewed the options selected
>for compilation, but I couldn't find out why rules using "-m unclean"
>return the following:
>
 >      iptables: no chain/target/match by that name
>
>Any sugestions, please?

ok heres a few for ya , :D

did you try to insmod / lsmod to make sure this module was even loaded
before
trying to load it through iptables ...

if not do an 'lsmod' to make sure you have the module loaded, if it isnt
loaded
try using something like this to see what errors it gives us back ...

insmod ipt_unclean

or depmod -a

did that give any errors ?

actually do a slocate on your system for the file does it exist ?

tell us how you go

bye :D

Hard__warE









