From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Default syslog level from -j LOG
Date: Wed, 11 Apr 2007 19:41:25 +0200
Message-ID: <461D1DC5.5020307@plouf.fr.eu.org>
References: <461BDAD5.8020208@samera.com.py> <461CFF02.9080905@samera.com.py>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <461CFF02.9080905@samera.com.py>
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

Oliver Schulze L. a =E9crit :
> what is the default syslog level for the LOG target?

You should file a bug report against CentOS for providing a broken=20
manpage for iptables. Mine says :

--log-level level
         Level  of  logging  (numeric or see syslog.conf(5)). The default
         level is warning.

