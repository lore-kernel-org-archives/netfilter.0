From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias
Date: Mon, 3 Jun 2002 23:09:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032209.g53M9DA25322@Networker.rockstone.co.uk>
References: <20020603220345.61683.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603220345.61683.qmail@web9904.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Monday 03 June 2002 11:03 pm, "J=F6rgen" Danielsson wrote:

> Running a firewall with 6 diff networks, and using a
> default policy that is drop, then as far as i know you
> have to add -i and -o option to forward rules in order
> for them to work. Or am I wrong there ?

Well, you don't *have* to, but it's a good idea.

However, I still think you can do everything you want to just by calling th=
em=20
eth1, and not trying to use eth1:0, eth1:1 etc.


Antony.

