From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Loding rules
Date: Mon, 16 Dec 2002 14:42:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212161442.43121.netfilter@newkirk.us>
References: <3df77ff9.7a14.0@unacs.bg>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3df77ff9.7a14.0@unacs.bg>
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
To: nedco@unacs.bg, netfilter@lists.netfilter.org

On Wednesday 11 December 2002 01:12 pm, nedco@unacs.bg wrote:
> Hi,
>  How to load fast about 20000 rules in iptables.
>  If some document will be help , please let me know  :)
>
> Thanks a lot
> Nedco

As long as you don't need to dynamically define the rules (IE using a=20
dynamic IP) iptables-save and iptables-restore should be your simple=20
answer.  Oscar's tutorial explains save and restore at:=20
http://iptables-tutorial.frozentux.net/chunkyhtml/saveandrestore.html

These will load the complete ruleset in a very few operations, instead of=
=20
about 40000.  (based on your 20000 figure above)

j

