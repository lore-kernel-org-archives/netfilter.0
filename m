From: runlevel0 <kassad@wanadoo.saraswati>
Subject: Re: Three kernel Oops/panic/BUG ksymoopses (kernel BUG at
	buffer.c:539)
Date: Mon, 05 Jan 2004 20:39:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073331581.4057.7.camel@saraswati>
References: <Pine.LNX.4.44.0401031352040.2301-100000@poirot.grange>
	 <87ekugzopi.fsf@midmaine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87ekugzopi.fsf@midmaine.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

El s=E1b, 03-01-2004 a las 22:50, Erik Bourget escribi=F3:

> *) chkrootkit says so (mod some hidden processes that are reported by a b=
ug in
>  chkrootkit according to Google)

The bug does  not rely on chkrootkit, but on ps, the error occurs
because ps lists some processes with the same PID 0 (in my case PID
3,4,5 and 6), top and related tools does display the correct PIDs, but
chkrootkit, which uses ps is fooled into thinking the machine is
infected by a lkm troyan.

I already sent a bug-report to the procps team.

- Enric Montero




