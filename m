From: John Haxby <john.haxby@oracle.com>
Subject: Re: Brouter basic question .
Date: Tue, 30 Mar 2010 16:00:16 +0100
Message-ID: <4BB21200.1080807@oracle.com>
References: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On 30/03/10 14:01, ratheesh k wrote:
> Hi ,
>
>   i have a rule
>
>             ebtables -t broute -A BROUTING -j ACCEPT .
>
> So packet wont traverse any other chain ?  ( Prerouting , Input ,
> Forward , Postrouting ) ???
>    

I thought this was obvious, but on second thoughts, it's probably not as 
obvious as all that

$ man ebtables
...
                          The targets DROP and ACCEPT have a special 
meaning in
               the broute table (these names are used instead of more  
descrip-
               tive  names  to keep the implementation generic).  DROP 
actually
               means the frame has to be routed, while ACCEPT means  
the  frame
               has  to  be bridged.

and in the diagram that Jan pointed to 
(http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg) 
it becomes clear: -J ACCEPT means that the frame goes to the ebtables 
nat table; DROP means it goes up into the network layer for iptables to 
play with.

You'll make life easier for yourself as well if you call layer two 
things "frames" and layer three things "packets".

jch


