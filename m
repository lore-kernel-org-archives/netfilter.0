From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: If i follow these stpes for my iptables?
Date: Fri, 13 Sep 2002 07:36:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c25ae7$91d6e4c0$0401000a@win2k>
References: <20020913033213.89569.qmail@web40601.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020913033213.89569.qmail@web40601.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

> What im asking is if i follow these steps  should i
> have any problems cause this is my 3 rd try with this
> i wannaknow what i am doing wrong.. see i thought it
> maybe casue i have already have IPTABLES installed im
> instaling 1.2.7 worng???

Right.
So what did you install ? There's no such thing as "Linux 7.2". Is it
RedHat 7.2 ?
And is you do : rpm -q iptables, does it tell you it has iptables
installed ? (Or try : whereis iptables, to check if it sees multiple
iptables' in your path.)
If so, you may want to uninstall it. Also check if ipchains is
installed ; you don't need nor want it.
Besides that, you're mailing this list because you seem to have a
problem with something but you didn't tell us what that problem is.
You only told us what you did.
Could you give more details about any errors, things that happen or
don't happen ?


Rob


