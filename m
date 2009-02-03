From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: How to reset routing completely?
Date: Tue, 3 Feb 2009 22:48:01 +0200
Message-ID: <d39744a20902031248w6f63d976wdf8181d995b6edf6@mail.gmail.com>
References: <200902031943.58617.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tT4pC26ctyFNJGayfQfYN2P4DwNudEbL1d6pTTdCY4Y=;
        b=u+SM9gYlICywc/LbrYlPdNFCGH51ubIsadSaFY8txV7fQqAi08Ac+idhFYKHZnaruK
         RbsIE/L3M1PllObyFX/wczS14Oxu5h+0DWhehzzVtapjFa7Mmb1k4EuYaE8tZqJ4jA3s
         2MyNNbTugwIVAcgAKywY15BL7l/5i8HTHrRJQ=
In-Reply-To: <200902031943.58617.Karlis.Repsons@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-13?Q?K=E2rlis_Repsons?= <karlis.repsons@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Check also if you have '1' in /proc/sys/net/ipv4/ip_forward.
Default policies of the chains?
You could be more specific. What is 'functional network'? Provide some
output of dmesg, various logs, iptables -L -n -v, route -n, etc.

On Tue, Feb 3, 2009 at 9:43 PM, K=E2rlis Repsons <karlis.repsons@gmail.=
com> wrote:
> While experimenting, I managed to reach a state, where I could not ma=
ke my
> network functional again, even if I deleted all rules and routes with=
 ip and
> did reset firewall.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
