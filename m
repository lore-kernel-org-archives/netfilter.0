From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: default entries
Date: Mon, 16 Jan 2006 10:11:08 +0100 (CET)
Message-ID: <49266.193.173.147.3.1137402668.squirrel@webmail.sterenborg.info>
References: <20060116082038.20590.qmail@web33412.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060116082038.20590.qmail@web33412.mail.mud.yahoo.com>
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

On Mon, January 16, 2006 09:20, Britto wrote:
> Hi,
>
> Could pls anyone explain the following default entries
> in the iptables
>
> :RH-Firewall-1-INPUT - [0:0]
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT

A new chain called "RH-Firewall-1-INPUT" is created and left empty.
The INPUT chain always jumps to chain "RH-Firewall-1-INPUT".
The FORWARD chain always jumps to chain "RH-Firewall-1-INPUT".

This will probably do nothing, but I don't know if there's anything
else in the script.


Gr,
Rob



