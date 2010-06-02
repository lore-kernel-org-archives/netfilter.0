From: Curby <curby@cur.by>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Wed, 2 Jun 2010 10:58:09 -0600
Message-ID: <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>
References: <loom.20100602T012732-376@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20100602T012732-376@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremiah Crockett <jrmhcrcktt@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Jun 1, 2010 at 5:31 PM, Jeremiah Crockett <jrmhcrcktt@gmail.com> wrote:
> I've searched the list archives and googled available iptables documentation,
> but haven't yet found satisfactory explanations for iptables states, in

After talking to a colleague about a recent ruleset of mine, we came
to the same conclusion, i.e. the existing docs aren't very good at
explaining specifically what causes a packet to be marked one way or
another.  As one example of many, this doesn't seem to be complete, or
even necessarily correct:

http://www.faqs.org/docs/iptables/userlandstates.html

The problem is that a packet that is NEW could be marked INVALID due
to a problem within the packet, e.g. an impossible or
standards-noncompliant combination of flags, so the determination of
NEW is only made after INVALID, RELATED, and ESTABLISHED are shown to
not apply.  This is counter to a lot of documentation which starts by
mentioning NEW first, from which readers might infer that NEW packets
will never match INVALID because they were already marked NEW.

In short, I agree with Jeremiah in that a more complete description of
these states would be very useful.  "Go read the code" does not
suffice, but it's currently the only option.

--Mike
