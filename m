From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 10:16:53 +0530
Message-ID: <cfeab66d1002272046o320823b3t49f90044da1253ce@mail.gmail.com>
References: <4b8984a7.0ab6660a.24bd.1f7f@mx.google.com>
	 <4B898B4B.5050301@gatworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=sHK0gC5h3eswHnRGgUb27CQDm1k8S/idZ7Foe3R8y2M=;
        b=lCk2gBhCIRz6wH9gMrpduKIcFWOflQlkT+0e2vZiRvqzMB6jUQygGaLj/C5iA65UQN
         OEMofnWN22LkT2xXJrYnWeLjl+AjknFg0kRMGnLBkWskgmONmTxbES7tkK9BNvoZh9Tz
         xSPan5hgaE8zTlhgRa9ZTEPyrgO2MtsOU66k4=
In-Reply-To: <4B898B4B.5050301@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "U. George" <netbeans@gatworks.com>
Cc: netfilter@vger.kernel.org

George ,

             for -p option , we can specify icmp ( layer 3 protocol )
or other layer 4 protocol other than UDP and TCP .

             I could be wrong . I am also a beginner .

Thanks,
Ratheesh.



On Sun, Feb 28, 2010 at 2:44 AM, U. George <netbeans@gatworks.com> wrot=
e:
> It makes no diff to either udp or tcp - port address are at the same =
header
> offset. It does makes a difference if you want to test both in the ru=
le. I
> only want to test ports with this rule.
>
> On 02/27/2010 03:46 PM, richard.horton@solstans.co.uk wrote:
> =A0And as each rule is distinct the line with multiport does not know=
 you have
> already determined the protocol...
> Ahhh, *But I know*. I designed the filter that way. If u want to *war=
n* me,
> then thats probably ok.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
