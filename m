From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: logs
Date: 20 Jan 2003 08:57:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043049437.19763.4.camel@porky>
References: <1043048340.20296.0.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043048340.20296.0.camel@bigblue>
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
To: netfilter <netfilter@lists.netfilter.org>

Le lun 20/01/2003 =E0 08:39, Paulo Andre a =E9crit :
> Would like to know some views on logging netfilter, is using ulogd
> better than log...???

ulogd depends on a daemon, and daemon can fails.
But, I never see this happen. So the main issue is not this one.

With ulogd you can log directly into a SQL database, and you've got at
least an interface (written in php) to analyse your logs :
	http://home.regit.org/ulogd-php.html
(end of self ad)

An other avantage of ulogd is the fact that you can use different output
in the same type (file and sql for example). Furhtermore you can say how
many packet should be log at at time and that can help to avoid I/O
overload.

--
Eric Leblond
mail : eleblond@init-sys.com



