From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Does the INVALID state filter block port (nmap) scans?
Date: Mon, 8 Feb 2010 21:52:51 +0000
Message-ID: <ac5c74141002081352k40b6d8beve3906cef75224114@mail.gmail.com>
References: <ac5c74141002040341m12a9abeaj9533c77ade2edec8@mail.gmail.com>
	 <3fa630a21002081337sa8025e0g51e1c3ec099482eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=RwJ+voYn6ENi7IKKtkOiZxejYPuHkob6H5WM9ZD4xVQ=;
        b=fPf/MNdUOy8yHyQyHt4IOXBLTrztueE7b9EVvJ9jpl0pEDglCBuMAD4kUX4pRMSJYm
         zvdySC2J/nPFgVZGpyVrmA6mPOn2SaYziu1g4oKLkIqIeJfaSUtELTKja0+D4xqDBipT
         dQT6Q9UzLIT09vqGAJhfPsVnAMem7LLeU1whc=
In-Reply-To: <3fa630a21002081337sa8025e0g51e1c3ec099482eb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Weedy <weedy2887@gmail.com>
Cc: netfilter@vger.kernel.org

Hi there,

I have not received an answer as of yet.

Any thoughts or are you also seeking an answer to the same question?


On Mon, Feb 8, 2010 at 9:37 PM, Weedy <weedy2887@gmail.com> wrote:
> On Thu, Feb 4, 2010 at 6:41 AM, paddy joesoap <paddyjoesoap@gmail.com=
> wrote:
>> Hi all,
>>
>> Does the INVALID state filter prevent port (nmap) scans?
>>
>> That is, would the following stateful rule:
>>
>> iptables -A INPUT -m state --state INVALID -j DROP
>>
>> do the same job as the following stateless rules?
>>
>> iptables -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m =A0-j DROP
>> iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
>> iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
>> iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
>> iptables -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
>> iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
>> iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
>> iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
>> iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
>> etc etc.
>>
>
> Did this guy ever get an answer?
>
