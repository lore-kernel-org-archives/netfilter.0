From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 14:19:03 +0200
Message-ID: <d39744a20901280419g4e19dd95g84874e7532b17e81@mail.gmail.com>
References: <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
	 <386978.92907.qm@web31606.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=P+zfxzBBJsenn9QMyWdmQx2bflh4TvsS2kRozlbX87s=;
        b=LkpZ2YW0GZTzp89zjKSu8f9Wya/eAsjTQAQz181oPaEvUblg9ODGSk9eW1GV14Kxe2
         6n9waT3wKb0DPlUyhtLHSyx1mYHjd4j4G9oqgA17bNfN/4udIFxC+mn8NAy9aIimjfNO
         IRzpj8S3PN7vHK55zCtQva+BjOi7tCoQoZhB8=
In-Reply-To: <386978.92907.qm@web31606.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kpele_ntua@yahoo.com
Cc: netfilter@vger.kernel.org

Dropping ACKs is not the way traffic shaping should be done. TCP over
wireless has one weakness - any packet loss greatly decreases
performance of the network. If the station B does not recieve ACKs it
would resend the previous packet thus flooding your wireless link with
un-necessarry data packets.
If you want to limit the client's bandwidth you should be looking for
another QoS solution that would depend on your network equipment.

On Wed, Jan 28, 2009 at 2:06 PM, Kostas Pelechrinis
<kpele_ntua@yahoo.com> wrote:
> Hi Ivan,
>
> thanks a lot for the info about the nth module.  Well I know that the quality of the link is going to drop but this is what exactly I want :) I want to force a client "reduce" its rate by not sending ACKs to him.  My concern is that 802.11 ACKs are being handled at the firmware and I do not know if iptables can handle this.
>
> Anyone knows anything about this?
>
> Thanks a lot,
> Kostas
>
>
> --- On Wed, 1/28/09, Ivan Petrushev <ivanatora@gmail.com> wrote:
>
>> From: Ivan Petrushev <ivanatora@gmail.com>
>> Subject: Re: Blocking outgoing 802.11 ACKs
>> To: kpele_ntua@yahoo.com
>> Cc: netfilter@vger.kernel.org
>> Date: Wednesday, January 28, 2009, 6:29 AM
>> iptables has "nth" match extension that matches
>> every n-th packet. It
>> is described in the man page.
>> But why would you want to drop ACK packets? That would have
>> negative
>> impact on your link.
>>
>> Ivan.
>>
>> On Wed, Jan 28, 2009 at 12:41 PM, Kostas Pelechrinis
>> <kpele_ntua@yahoo.com> wrote:
>> > Hi all,
>> >
>> > I have two nodes communicating via their wireless
>> interfaces.  Let us assume that node A sends packets to node
>> B.  Once node B is receiving the packets, he transmits the
>> 802.11 ACK frame.  What I want to do is to prevent node B
>> from sending this ACK frames once every two packets for
>> example.
>> >
>> > One indirect way I have thought about is setting the
>> following rule to node B:
>> >
>> > iptables -A INPUT -i ath0 -m limit --limit
>> _SPECIFIED-LIMIT_ -s _NODE'S A IP_ -j DROP
>> >
>> > However,  I am not sure if this prevents the 802.11
>> ACKs from being transmitted.  This has to do with the place
>> where the above rule is being enforced.
>> >
>> > Do you have any comments or suggestions on how I can
>> achieve what I am trying to?
>> >
>> > Thanks,
>> > Kostas
>> >
>> >
>> >
>> > --
>> > To unsubscribe from this list: send the line
>> "unsubscribe netfilter" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at
>> http://vger.kernel.org/majordomo-info.html
>> >
>
>
>
>
