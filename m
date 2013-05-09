From: Bob Reiber <bob@bkss.net>
Subject: Re: Simulating router breaking idle TCP connections with IPTABLES
Date: Thu, 9 May 2013 14:41:12 +0000
Message-ID: <CDB102CC.2B337%bob@bkss.net>
References: <1368085606.46753.YahooMailNeo@web163403.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1368085606.46753.YahooMailNeo@web163403.mail.gq1.yahoo.com>
Content-Language: en-US
Content-ID: <C9749CE6FBF0C84A9FD0F8A72D8E899E@fwd6.exghost.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Timothy Arceri <t_arceri@yahoo.com.au>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Tim,

Just to be clear, you are using sftp via the wan port to access a server
inside the firewall? I think the port triggering timer acts on idle
sessions. So if you connect and then don't do anything the timer should
close the session.

Bob Reiber
BK Sales and Service
tel: (650) 376 1122




On 5/9/13 12:46 AM, "Timothy Arceri" <t_arceri@yahoo.com.au> wrote:

>Thanks Bob, I have been attempting to use the port triggering for sftp
>i.e ssh connections on port 22 but they dont seem to be getting
>triggered. Is it likely that the ssh port would be ignored from port
>triggering on this router?? The router logs do not show anything to
>indicate that it even attempted port triggering.
>
>Thanks for your help,
>Tim
>
>
>
>----- Original Message -----
>From: Bob Reiber <bob@bkss.net>
>To: Timothy Arceri <t_arceri@yahoo.com.au>; "netfilter@vger.kernel.org"
><netfilter@vger.kernel.org>
>Cc: 
>Sent: Tuesday, 7 May 2013 1:34 AM
>Subject: RE: Simulating router breaking idle TCP connections with IPTABLES
>
>Look in port triggering. I think there is a timer setting there where you
>can specify when to close the tcp port
>
>Bob Reiber
>BK Sales and Service
>3211 Longfellow Dr
>Belmont, CA 94002
>Tel: 650 376 1122
>Fax: 650 240 4556
>
>-----Original Message-----
>From: netfilter-owner@vger.kernel.org
>[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Timothy Arceri
>Sent: Monday, May 6, 2013 3:59 AM
>To: netfilter@vger.kernel.org
>Subject: Re: Simulating router breaking idle TCP connections with IPTABLES
>
>>Um, what kind of router do you have? Even some of the very basic home
>>routers have tcp timers on them.
>
>
>I have a Netgear WNR1000v3. Cant find any settings for tcp timers.
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html



The information in this electronic mail is intended for the named recipients only. It may contain privileged and confidential matter; and if you are not an intended recipient, you are hereby notified that copying, forwarding or other dissemination or distribution of thiscommunication by any means is prohibited. If you have received this electronic mail in error, please notify the sender immediately.CONFIDENTIALITY NOTICE: This email message is for the sole use of the intended recipient and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply email and destroy all copies of the original message and any attachments. Thank you.
