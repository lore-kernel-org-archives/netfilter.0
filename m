From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Fwd: macro & iptables
Date: Wed, 31 Aug 2005 10:35:57 -0400
Message-ID: <65aa6af9050831073513cd91a4@mail.gmail.com>
References: <200508310629.08059.rob0@gmx.co.uk>
	<20050831141346.53535.qmail@web53301.mail.yahoo.com>
	<65aa6af905083107354ca663e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905083107354ca663e0@mail.gmail.com>
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

you have a list of IPs? say, for example, you want to accept those IPs
for input (one IP per line). I guess this will work:

cat /etc/iplist.txt | while read anIP; do
    iptables -A INPUT -s $anIP -j ACCEPT
done;

On 8/31/05, Agung <duppeh@yahoo.com> wrote:
> let say... i have lists of ip in /etc/iplist.txt
> is it possible to call that list, like perhaps in pf
> table <ip> persist file "/etc/iplist.txt" ?
> or i should use some bash scripting ?
> thank you for your assistance :-)
>
>
>
> ____________________________________________________
> Start your day with Yahoo! - make it your home page
> http://www.yahoo.com/r/hs
>
>
>

