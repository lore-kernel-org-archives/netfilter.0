From: Jorge Davila <isaac@nicaraguarealestate.com>
Subject: Re: Problem with nat table in iptables
Date: Fri, 28 May 2004 14:50:39 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40B7A61F.8@nicaraguarealestate.com>
References: <40B6322E.6050205@nicaraguarealestate.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40B6322E.6050205@nicaraguarealestate.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Jorge Davila wrote:

> Hi!
>
> When I insert a new rule in the chain INPUT and save/restart iptables=20
> my firewall lost the nat table.
>
> Someone have an idea about how recover the nat table?
>
> Thanks,
>
> Jorge D=E1vila.
>

The problem has been resolved... the nat was "eliminated" when I try to=20
see the firewall configuration simultaneously with webmin and command=20
line after insert the rule. :)



