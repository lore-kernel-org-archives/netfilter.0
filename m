From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: monitor masq. packets
Date: Fri, 6 Dec 2002 17:00:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212061700.38504.netfilter@newkirk.us>
References: <001a01c29d6e$2dedd580$7900a8c0@ibmfhyhjarw99d>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001a01c29d6e$2dedd580$7900a8c0@ibmfhyhjarw99d>
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
To: zmooth <zmooth@btinternet.com>, netfilter@lists.netfilter.org

On Friday 06 December 2002 04:26 pm, zmooth wrote:
> Hi, ive noticed that : netstat -M does not work anymore. Is it just me
> ? i get :
>
>     netstat: no support for 'ip_masquerade' on this system, while
> iptables is loaded and masquerading already. Please help

Are you using the MASQUERADE target, or SNAT?

j


