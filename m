From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables does not support chkconfig!
Date: Mon, 23 Dec 2002 01:53:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212230153.50801.netfilter@newkirk.us>
References: <20021223062606.14516.qmail@web40609.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021223062606.14516.qmail@web40609.mail.yahoo.com>
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
To: Silkk <crystaldrinker@yahoo.com>, netfilter@lists.netfilter.org

On Monday 23 December 2002 01:26 am, Silkk wrote:
> Here is the error message im getting i found it in /var/log/boot.log
> firewall: /etc/rc3.d/s80 firewall: iptables: command not found
> last message repeated 71 times

Try changing "iptables" to "/sbin/iptables" or whatever path it actually=20
lives on.  (that's the one for an RPM install under RedHat, I believe) =20
You can't count on a script having valid paths set up during the system=20
startup, play it safe and be explicit.

j

> __________________________________________________
> Do you Yahoo!?

No, I don't... :^)

