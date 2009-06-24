From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 13:56:00 +0200
Message-ID: <004e01c9f4c2$bf788830$3e699890$@info>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>    <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt>    <001d01c9f4ba$316a3c30$943eb490$@info>    <200906241320.13779.christoph.paasch@gmail.com> <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jorge Bastos' <mysql.jorge@decimal.pt>, 'Christoph Paasch' <christoph.paasch@gmail.com>
Cc: netfilter@vger.kernel.org

>> On Wed June 24 2009 wrote Rob Sterenborg:
>>> $ipt -P FORWARD DROP
>>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>>> $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
>>> 
>> Watch out, that with these rules, you will allow any traffic to
>> pass, that has destination port 22. Thus, the outside can contact
>> you to port 22. And the inside can contact any host on the Internet
>> on port 22.

Yes, I didn't say the ruleset was perfect; it's just a starting point..
;-)

> No good then, i just want to allow traffic for ports defined by me,
> for the NAT'd machines.

So create more restrictive rules. Use -s and/or -d, etc. Think about
what you specifically want to allow and drop (or reject) everything
else. Your posts only mention port 22 so that's what my example does.

> Can you guys help on this? Sorry but i really have no idea, with
> the PREROUTING it was easy for me.

We don't know what you really want; there are no details so it's
impossible to say what exactly you should do. If you tell us what you
want you'll probably get a more detailed answer.

However, this is quite basic stuff which really is covered in the
IPTables Tutorial.


-- Rob


