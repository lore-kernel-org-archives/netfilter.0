From: Shawn Wilson <ag4ve.us@gmail.com>
Subject: Re: Getting iptables not to reply
Date: Mon, 30 Sep 2013 13:35:39 -0400
Message-ID: <d258c476-1215-47ba-84cc-9ca16fba3ca7@email.android.com>
References: <SNT147-W156511006C6569D034DE84BF140@phx.gbl> <3e46767e-0e68-4512-8d9c-2b8873d536fc@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=user-agent:in-reply-to:references:mime-version:content-type
         :content-transfer-encoding:subject:from:date:to:message-id;
        bh=EJUm0Mu4fB+T125tdiPmrldI/YZkiFqKIDv4js6T0wk=;
        b=hwrEO//Ai/3ShkCMSr8EEtvZ5/ul2zHhtmRkSCtA82NTwg0vH9afkIZQRRlD27Gas9
         6rGzq3At+R4ky0WwHQWfR7bv45mYTKXZcMOcwfeg2VIY/JxcjcyludfZNOKdOZyWvUBq
         1eMEfxtSUES8P3pV/RLbSU158RPE1Y7eS5L8QzV409GSiqHTEGiGwtZ5GzAcNBaRppF7
         Wxr1xcJKxGd8O9aR98RE/+JdtYIHBMNBZpIC2H6J2ukEwbfDxZMtzMs5WE83QVWop397
         PB4/L2zXmbXUnR58xCcmvHl7bS9eELM5Z8fUkg56rPyFG7ylmtSq4pG0LnSLfrQVcsk/
         DSsg==
In-Reply-To: <3e46767e-0e68-4512-8d9c-2b8873d536fc@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jack seth <bird_112@hotmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Err should've been FIN, SYN, or RST

Shawn Wilson <ag4ve.us@gmail.com> wrote:
>Do you want to respond with ACK, FIN, or RST?=20
>
>jack seth <bird_112@hotmail.com> wrote:
>>Ok, if you have an 'accept' rule for a service that is not currently
>>running, is it possible to have iptables to simply not respond instea=
d
>>of reporting the port as 'closed'?=C2=A0 During a port scan at grc.co=
m, if
>>the router doesn't reply the port will be reported as 'stealth'. 		 	=
=20
>
>>		  --
>>To unsubscribe from this list: send the line "unsubscribe netfilter"
>in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html

