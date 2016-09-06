From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Rule for PROTO=139?
Date: Tue, 6 Sep 2016 13:20:55 +0200
Message-ID: <57CEA697.9080308@sterenborg.info>
References: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Walter H." <walter.h@mathemainzel.info>, netfilter@vger.kernel.org

On 2016-09-06 12:58, Walter H. wrote:
> Hello,
>
> does anybody know with which rule I can catch these entries:
>
> [317607.438061] IN=br0 OUT= MAC=ff:ff:ff:ff:ff:ff:4c:72:b9:56:16:3e:08:00
> SRC=0.0.0.0 DST=255.255.255.255 LEN=72 TOS=0x00 PREC=0x00 TTL=255 ID=1624
> PROTO=139

According to my /etc/protocols, protocol 139 is called 'hip' (Host 
Identity Protocol). So, something like

     iptables -A INPUT -i br0 -p 139 -j DROP

or

     iptables -A INPUT -i br0 -p hip -j DROP

See also: man iptables


--
Rob

