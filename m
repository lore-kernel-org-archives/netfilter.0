From: John Corps <envoys@gmail.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 11:56:43 -0500
Message-ID: <CAFURDX_wWF=s9kC0-nW1rVtZ03bMox0KfK5DDu6EN=2Tmp_BSw@mail.gmail.com>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
	<1360946103.2251.2.camel@andylaptop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=LANMEnDFlXDGrYUyK6TxaqtjMFZFh22k8n7IIBJ5Kmk=;
        b=F2qH/pisaYOQIGln0drADqIEXXjiNILOOIFK4HGZJVegNKgrquTlAIgvwwig/qmBsi
         3DKLK4u66js384r408B+balh3HfhKoLMgNpEEvd3q4KkiXtXXEp2CmbtJaI0xQlh77um
         Azcc/MdOeYJevh/uQisX2XbyggaDY9VY2xgTezuneAGGdid7e0CHfgx3irjQJjTkuI1i
         e/dRcxgK7H4NEK92Paqwm7Mk8oGfDqmdhUusNlw03xnnb5NqxDQ+w4UOxrUHvqFZUln7
         zB1HK97lkTem8RO79To/AFj4bJruWQYmqqpkZgOHJWDEwNDMpZBayeZL6L8Y45higfOA
         swbA==
In-Reply-To: <1360946103.2251.2.camel@andylaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Whoops! forgot to reply to all and sent this only to Andy.

Tried this... and same result, page not displayed. Keep in mind these
are the only rules I have for iptables, do I need any other ones?

iptables -t nat -A PREROUTING -p tcp --dport 53 -j DNAT
--to-destination 192.168.1.2:53
iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT
--to-destination 192.168.1.2:53
iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
--to-destination 192.168.1.2:53
iptables -t nat -A PREROUTING -p tcp --sport 53 -j DNAT
--to-destination 192.168.1.2:53

On Fri, Feb 15, 2013 at 11:35 AM, Andrew Beverley <andy@andybev.com> wrote:
> On Fri, 2013-02-15 at 11:24 -0500, John Corps wrote:
>> Hello All,
>>
>> I am having issues with redirecting DNS requests to the internal dns
>> server. I have a very simple setup, if someone is put into vlan 1000
>> then they do not get internet access at all. If they keep the DNS
>> server assigned by DHCP, which is the IP of the gateway in vlan 1000,
>> every request they make to a website is resolved to this IP and served
>> up the webpage stating no internet is available. If they are clever
>> enough to set there own DNS servers, when they open a browser, they do
>> not get anything at all, just page can't be displayed. I have not done
>> anything with iptables yet as the internal dns server is just
>> resolving everything to the local IP address. What I want to do is if
>> they set there own DNS, redirect them anyways back to the internal
>> DNS. Here are the only 2 rules I have tried but they do not work at
>> all, maybe i am missing something? Any help would be greatly
>> appreciated!
>>
>> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dport
>> 53 -j REDIRECT --to-ports 53
>> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dport
>> 53 -j REDIRECT --to-ports 53
>
> If you want to redirect the requests to the local server, then you'll
> need to use the DNAT target instead. All you're doing in your rules is
> changing to port 53 a packet that is destined to port 53 (so nothing at
> all).
>
> Andy
>
>
