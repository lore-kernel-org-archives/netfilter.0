From: "hard__ware" <hard__ware@hotmail.com>
Subject: RE: SSH dnat
Date: Mon, 2 Dec 2002 05:06:48 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE31m7A5NgBxfBOnLFU00004041@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hello Ambor,

Im not to sure how much you know about gateways / dns
so im going to assume ...

1.) Have you made sure that The Internal SSH Server on
the local lan can use DNS correctly & has internet access
through the IPTables Gateway ( does "route -Nve" on the SSH Server show any
default routes ? )

2.) Have you set up any other kind of DNAT / Hosted services that sit behind
the Firewall that are working ???

3.) Also is your SSH Server Service even running on the right Port (ie in
your case Port: 2323)
you can display all Servers listen Ports with #> netstat -l --inet -nve

anyway good luck with IPTables & NetFilter

cyas...

Hard__warE

( here is a little laugh from a call that i got from a fool that upgraded a
Router / Net Connection On-Site of one of my Clients,
   because of contract reasons they had to the installation, and my company
was not allowed (but we are there Network Administrators ???  )

| MCSE  Tech |: ' No the problem is your fault, this box now needs a
reinstall '

]  MySelf  [: ' What's the problem ?'

| MCSE  Tech |: ' it cant access the internet but all the other machines can

]  MySelf  [: did you check the network settings , i.e, Default Gateway ,
DNS Entires , Subnets ect ect ???

| MCSE  Tech |: what do you think i am,  stupid ?

]  MySelf  [:  Not at all , (Yeah Right) i just have to make sure so i dont
have to come onsite for nothing...
anyway, well if you believe its all the same as the other machines and not
working ill come out within the Hour ...

40 Mins Later OnSite:   | MCSE  Tech |:  You must be the network technician
correct ?

]  MySelf  [:  Indeed i am, Please to meet you .. lets take alook at this
problem shall we ...

"I get straight on the Problem machine, go straight to Network Neighbour
Hood , Right Clicked -> Properties --> TCP/IP / LAN NDIS Device ..."

]  MySelf  [:  Why does this machine have its DNS set as the Gateway ?

| MCSE  Tech |: Because thats hows its ment to work ...

]  MySelf  [:  Well not unless your doing DNAT on that Basic Arse Router
for DNS Requests on Port: 53 too lets say like the ISP's DNS Servers (which
this router could not do)

| MCSE  Tech |:  Why didnt i think of that ... o well ...

]  MySelf  [:  Huh ??? (me all confused at this person's ability to use his
brain) no you stupid Microsoft Cisco Boy look at my certificate i can do
anyting ... it needs to be set on all machines to the ISP's DNS servers, as
we dont have any Internal DNS Servers ...

]  MySelf  [: Actually by the way, why isnt this machine set to Assign
Dynamic IP Address ??? becuase thats where it gets its Gateway / DNS info
from ?

| MCSE  Tech |: But you have to use Static IP's with this Router ... it wont
except Dynamic Address's

]  MySelf  [: Look go home , OMG , what do you know it actually works now ,
i wonder why ....

can yo belive that, what nerv of that guy ... Absoloute Windowz Tosser ....
LOL ... cyas



