From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: port 137 entries
Date: Fri, 29 Nov 2002 19:05:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211291905.44634.netfilter@newkirk.us>
References: <200211291938.07586.martin@bugs.unl.edu.ar>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211291938.07586.martin@bugs.unl.edu.ar>
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
To: Martin Marques <martin@bugs.unl.edu.ar>, netfilter@lists.netfilter.org

On Friday 29 November 2002 05:38 pm, Martin Marques wrote:
> I'm getting lots of firewall logs informing me that packages  with thes=
e
> specifications where blocked:
>
> scr-port 138, dest-port 138, dest IP <broadcast>
> scr-port 137, dest-port 137, dest IP <broadcast>
>
> scr-port 1029, dest-port 137, dest IP <my firewall IP>
>
> Any thoughts? Is this Bug bear virus?

NetBIOS.  You have MS machines on the network, right?

j

