From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LOG target and de-SNAT
Date: Thu, 26 Sep 2002 23:05:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926220601.TMBQ28842.mta06-svc.ntlworld.com@there>
References: <AB711091BCDBD51199B80060943F1A3C472F9F@MVOS001>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AB711091BCDBD51199B80060943F1A3C472F9F@MVOS001>
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

On Thursday 26 September 2002 11:41 pm, Couchet J (Jorge) wrote:

> Hello All,
>
> I have two questions about Netfilter:
>
> 1) The first, perhaps isn=B4t 100% Netfilter, but is related. How do you
> disable that the text log appear in the active tty when you use the LOG
> target? (the text log appear in the active tty -with the an user in the
> system or not- and in the message file, and I only want the text in the
> message file).

Use the --log-level option to the LOG target to assign the priority you wan=
t=20
for the logging, and then make sure your /etc/syslog.conf file specifies th=
at=20
this priority goes to a file and not to the console.

> 2) Which is the specific place/time where the de-SNAT is done? The SNAT is
> done in the POSTROUTING chain (in the nat table), and the de-SNAT where?

De-SNATting (on the reply packet) is carried out at the PREROUTING chain, b=
ut=20
is done in the background, automagically as they say, rather than needing a=
=20
specific rule for it in the PREROUTING chain.

Reply packets are recognised by the entry in the connection tracking table =

which was created by the outgoing packet, and they bypass the rules in the =

PREROUTING chain.

> How do I catch the packet before the de-SNAT operation is carried out??.

You can't unless you disable connection tracking and run a non-stateful=20
inspection firewall :-)


Antony.

--=20

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

