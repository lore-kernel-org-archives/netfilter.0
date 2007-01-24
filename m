From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Pid owner module
Date: Wed, 24 Jan 2007 11:15:42 +0100
Message-ID: <45B731CE.4000402@plouf.fr.eu.org>
References: <9772C290CD0BDF4B91356C9102BA886A0567BA9D@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9772C290CD0BDF4B91356C9102BA886A0567BA9D@ftrdmel1.rd.francetelecom.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

zze-FREDI POIROT N ext RD-MAPS-LAN a =E9crit :
> Jan 24 10:25:47 localhost kernel: ipt_owner: pid, sid and command
> matching not supported anymore
[...]
> 3. Since which kernel version has this module been disabled ?

Found in Changelog-2.6.14 :
   [NETFILTER]: Remove tasklist_lock abuse in ipt{,6}owner

   Rip out cmd/sid/pid matching since its unfixable broken and stands in
   the way of locking changes to tasklist_lock.

