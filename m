From: Curby <curby@cur.by>
Subject: Re: Check for rule existence
Date: Mon, 14 Jun 2010 11:23:39 -0600
Message-ID: <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com>
References: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mistick Levi <gmistick@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Jun 14, 2010 at 11:16 AM, Mistick Levi <gmistick@gmail.com> wrote:
> Hi,
> Does anyone know of a good way to check for a rule existence?
> So far I'm doing it with grep, and text manipulation...

Just a quick note that you might want to look at iptables-save instead
of vanilla iptables if you aren't already.  The former command gives
the rules in a sort of canonical form that is used for restoring
rulesets.  You'll have fewer spacing issues and such. Hopefully others
will have more to add. =)

--Mike
