From: Kim Jensen <kimj@dawn.dk>
Subject: Re: How filter IP address if it *changes* often?? (think dhcp)
Date: Fri, 28 Mar 2003 10:31:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303281031.29018.kimj@dawn.dk>
References: <20030327200056.A18916@spawar.navy.mil> <Pine.LNX.4.53.0303272314530.4873@gypsy> <20030327222617.A19911@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030327222617.A19911@spawar.navy.mil>
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
To: seberino@spawar.navy.mil, Steve Mickeler <steve@warning.ca>
Cc: netfilter@lists.netfilter.org

On Friday 28 March 2003 07:26, seberino@spawar.navy.mil wrote:
> Steve
>
> Thanks for the email.  Let me rerephrase my question.
> Perhaps I wasn't clear....
>
> How can you have a rule on your INPUT chain that
> only allows your local box's IP address if "local box IP address" can
> change without notice due to your DSL ISP's decision?
>
> Chris
>
Hi Chris,

If you are having one interface for all incoming traffic and one for outg=
oing=20
traffic, then you can simply filter it by looking at the interface like:

iptables -A INPUT -i LOCAL_IF -j ACCEPT

You can also set up your rule so it allows traffic from the IP range you =
have=20
internally:

iptables -A INPUT -s LOCAL_NET -j ACCEPT

The rules are a little primitive, but I hope you get the idea.

/Kim


