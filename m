From: Robert White <rwhite@pobox.com>
Subject: Re: Q: using PREROUTING to change destination
Date: Tue, 14 Mar 2017 11:06:09 +0000
Message-ID: <1c436605-e4d2-e0a0-1ba9-6ecbfd6746d2@pobox.com>
References: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ran Shalit <ranshalit@gmail.com>, netfilter@vger.kernel.org

On 03/14/17 08:56, Ran Shalit wrote:
> Hello,
>
> I am trying to understand how to use rules with PREROUTING and
> transparent proxy.

Okay, at any moment an IP packet has two addresses inside it. "From" and 
"To". From is the "Source" and To is "Destination".

So now forget computers entirely for a second and instead imagine a 
corporate mail room for a small company.

The corporation tells customers to send pre-sale questions to 
"Department 1" and complaints to "Department 2".

The mail room knows that "Department 1" is actually Alice, and 
"Department 2" is Betty.

When the mail room gets something for Department 1 they "route it to Alice".

So the customer doesn't need to know where or who Betty is, so they 
won't stab out he tires for her response to her their complaint.

So in the mail room the easiest thing to do is to cross off "Department 
1" and write "Alice" on the envelope, and cross off the Department 2 to 
write in Betty.

Now we need to also be sure that whatever anybody sends out from their 
desk will have the mailroom as the return address. That's because the 
postal service has no clue who Alice and Betty are. They just have the 
building address.

In real letters we can put 'attn: Betty' but we are already putting 
'attn: Department 2' so that we don't ever have to tell anybody if we 
fire Betty and replace her with Chris.


So back to computers...

DNAT means "cross off the existing destination and

iptables --table nat --append PREROUTING --destination Mailroom --dport 
Department_1 --jump DNAT --to Alice
iptables --table nat --append PREROUTING --destination Mailroom --dport 
Department_2 --jump DNAT --to Betty

iptables --table nat --append POSTROUTING --out-interface postal_service 
--jump SNAT --from Mailroom

ASIDE: in the above the names "Alice", "Betty", and "Mailroom" are from 
the /etc/hosts or named/bind, and the department names are from 
/etc/services. But literal numbers are common. The translation from 
names to numbers and back is done by the "iptables" tool. The actual 
rules put into the kernel just has numbers there which is what 
"--numeric" means when you do "iptables --table nat --list --numeric". 
That option means "don't turn the numbers back into names" and so on.

So there we are. We need to know "who the packet needs to be sent to", 
q.v. where to route it, _before_ we route it to the individual's desk.

And we need to know that a packet is going out the the rest of the world 
before we cross out the return address, the "source address", before we 
post it.

Why? Well if the packet is from Alice to Betty it's going to stay in the 
building so nobody needs to change any addresses at all.

Just remember that the S in SNAT is "source" and the D in DNAT is 
"destination" and "source" or "destination" is what you are crossing off 
and replacing in the packet.

You need to rewrite the destination before you know what local machine 
to send it to, so it that's got to happen before you _can_ route it to 
that machine.

Now if _you_ had to keep track of these connections in manual rules it 
would be nearly impossible. The kernel provides "the connection 
tracker". Once you tell the system to "Translate the Destination 
Address" for the first packet exchanged (e.g. --cstate NEW) it will 
automatically reverse those changes in the replies (ESTABLISHED 
connection) and in some specifically related (RELATED).

So the best thing to do until you get the hang of it is to mentally say 
"Destination Network Address Translation" when you see "DNAT".

Life Pro Tip: if you are new to iptables, I _strongly_ suggest using the 
long arguments "--table" instead of "-t", "--insert" instead of "-I", 
and so on. It will reinforce your understanding of what is right and 
wrong as you experiment.

--Rob.
