From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 21:45:59 +0800
Message-ID: <4ECF9C17.80804@gmail.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com> <janteh$3ui$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=NbOr9tO3k5dUmmPa5L0gjf3C5O862xSCzESe+nLOG3Y=;
        b=ilCQ81qJzl/7BC4X8W4H7J6Mlm9fc7YPUyJv+9gJ3Nda9TJ39wyBWdJno8O3lIb40h
         IrG9+TdARTus7ud7a6ilfZeXwftUMJkje8p3YSQnZg8FmqVBb0XwKSjaHiGGwXfl0C4R
         C8iJCx7zSqoCim7BFLGwO3KRtGoTFIV4YPE7w=
In-Reply-To: <janteh$3ui$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: netfilter@vger.kernel.org

Hi Brian:
We supply java application server product to our customer.
     The application server supplies jdbc connection pool functionality 
to deployed web application.
     The jdbc connection pool usually keeps a fixed count of physical 
connections to database which are socket connections.
     The support staff reflected that the connections in the 
connection pool were dropped by firewall after 30mins to become idle 
under customer environment .
     I can't get clear information whether the firewall product is iptables.

     I googled the topic "firewall drop idle connection" on the 
Internet, found somebody met the same issue like me even though they 
used the firewall product of cisco
     such as:
http://vivekagarwal.wordpress.com/2009/07/04/firewall-dropping-oracle-database-connections-in-websphere-connection-pool/

     Even some web page indicated that iptables can drop idle 
connection, such as the tcp section of

http://www.rigacci.org/wiki/lib/exe/fetch.php/doc/appunti/linux/sa/iptables/conntrack.html


     I am familiar with Linux, so i want to reproduce the issue with 
iptables, this is why i posed this topic, I want to know whether 
iptables support this or not.
     If yes, what is the detailed rule set, if not then that is.

     As to whether iptables should support this feature, it seems that 
some product supported this, such as pfsense on freebsd or some 
commercial product.
     Because I never touch freebsd, so I don't want to use pfsense . 
 From my opinion closing the idle connection can avoid the upper 
application leak idle connection,
     releasing unused system socket resource. So it is a useful feature 
if iptables can support this.

     This is the background for my question and is my real-world use 
case, haw-haw.
     Thanks for your help and hope for your answer.

On 2011-11-25 19:16, Brian J. Murrell wrote:
> On 11-11-25 12:37 AM, lu zhongda wrote:
>> On 2011-11-24 19:30, Brian J. Murrell wrote:
>>> You didn't answer my other question though, which is why do you think
>>> you need to be dropping idle, yet still ESTABLISHED sessions (and
>>> breaking higher level protocols when you do that)?
>> The need to drop idle connection comes from one technical support request:
> Answering my question of "why do you want to do this" with "because
> somebody asked" does not really answer the question though.
>
> There is an important reason for me to to ask and you to answer the
> question (i.e. with a real-world use-case) and that's because typically
> when somebody is proposing to do things that are "strange" or "not as
> intended" (and indeed which will result in other things breaking -- like
> TCP in this case) it's because they are trying to solve a problem with
> the wrong tool.
>
> Can you please provide a real-world use-case as to why you'd want/need
> to stop (i.e. break) an open TCP session?
>
> Cheers,
> b.
>

