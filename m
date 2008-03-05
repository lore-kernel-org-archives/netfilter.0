From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Wed, 5 Mar 2008 11:37:08 +0100
Message-ID: <20080305103707.GA9740@outback.rfc2324.org>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080304231606.GA16376@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter discussion list <netfilter@vger.kernel.org>

Am Wednesday, den  5 March hub martin f krafft folgendes in die Tasten:

Hi!

> You probably now the feeling, that cold and hot rush of adrenaline
> after you've typed "iptables-restore < new-ruleset" and didn't get to
> see the shell prompt again: you've just locked yourself out of
> a machine that=E2=80=99s potentially far away, and you feel like vand=
alism,
> or screaming on the top of your lungs, or whatever.

> I've had that feelings once too many and ended up writing
> iptables-apply[0] with a docbook manpage[1].

> 0. http://svn.madduck.net/pub/sbin/base/iptables-apply
> 1. http://svn.madduck.net/pub/sbin/base/iptables-apply.dbk

> iptables-apply is a simple shell script which applies the new
> ruleset and then prompts whether you like it. If you've locked
> yourself out, you cannot answer the prompt, and if you don't, the
> script rolls back the ruleset. Nice and simple.

Oh well, that's a different approach to my version :)
While hacking on a firewall management framework, I build such a
thing, tooo.

It works a bit different but does basicly the same thing.

My idea was to create a 'token' when the rules have been loaded, wait
for=20
$TIME and if the token still exists (as in has no been deleted,
because
it was impossible) revert the ruleset to the old one.

Maybe this is also interesting for others:

 * http://files.rfc2324.org/projects/alff/agent/alff-cat has to be inst=
alled
   on the firewalls (config files in the same directory)
 * I push rules to my machines using Alff but basicly a
   cat $rules_file | ssh -l root -x $firewall "alff-cat -" should work.

My scripts still use shell scripts with iptables command in them, as I =
did
not finish the conversion to iptables-restore...

Just my 0,02 EUR

Greetz from frosty Zurich
Max
--=20
	Follow the white penguin.
