From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: What is the difference between modprobe and insmod?
Date: Fri, 20 Dec 2002 03:20:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212200320.52534.netfilter@newkirk.us>
References: <20021220070647.BA0B01C959464@sm181.163.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021220070647.BA0B01C959464@sm181.163.com>
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
To: bobo <boboaq@163.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Cc: "bobowd@sohu.com" <bobowd@sohu.com>

On Friday 20 December 2002 02:11 am, bobo wrote:
>          While writing IPtables scripts,there are two command:=20
> modprobe and insmod.
>
>          In some example,some use : modprobe ip_tables,but others use:
> insmod  ip_tables.
>
>          Why?  Is there difference between them?

For the purpose of loading specified modules you can consider them the=20
same.  Modprobe is a higher-level interface that will call insmod.  I=20
personally use modprobe since it succeeds silently.  IE, if it=20
successfully loads the module, or if the module is already loaded,=20
insmod will report this, while modprobe will not output anything in=20
these situations.  They will both, by default, report failure to=20
find/load a module, and the -q option tells them both to be quiet about=20
errors, but insmod will /still/ report success even with -q.

For full details see "man insmod" and "man modprobe"... :^)
(under KDE, the default IIRC with RedHat 7.2,  using alt-F2 then #insmod=20
in the dialog, or #insmod as a URL in konquerer works nicely)

j


