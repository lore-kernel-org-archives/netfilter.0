From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: inline problem
Date: Mon, 26 Dec 2005 20:09:06 +0100 (CET)
Message-ID: <18869.80.127.73.119.1135624146.squirrel@webmail.sterenborg.info>
References: <20051226115316.89734.qmail@web35913.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051226115316.89734.qmail@web35913.mail.mud.yahoo.com>
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

On Mon, December 26, 2005 12:53, Noman Liaquat wrote:
...
> checking for libipq.h... yes
> checking for ipq_set_mode in -lipq... no
>
>    ERROR!  Libipq library/headers not found, go get it
> from
>    www.netfilter.org or use the --with-libipq-*
> options,
>    if you have it installed in unusual place

Configure found the header file so it looks like you installed libipq.
But, configure didn't find ipq_set_mode in the library.
Did you add the path to libipq in /etc/ld.so.conf (if necessary) and
execute "ldconfig" ?


Gr,
Rob



