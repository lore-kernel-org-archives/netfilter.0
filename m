From: George Georgalis <georgw@galis.org>
Subject: Re: Internal machines can't resolve external addresses
Date: Wed, 12 Jun 2002 14:21:12 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020612142112.B1103@trot.haven.dom>
References: <003801c2120c$eb198160$020aa8c0@matttm9svd8lrh> <000001c21222$f17749f0$7200a8c0@blue> <20020612113441.D30105@trot.haven.dom> <20020612115835.E30105@trot.haven.dom> <005701c21230$ea1351a0$52cfd3cf@michael>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <005701c21230$ea1351a0$52cfd3cf@michael>; from hudin@zoetrope.com on Wed, Jun 12, 2002 at 09:48:00AM -0700
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Hudin <hudin@zoetrope.com>
Cc: netfilter@lists.samba.org

I would guess the category of this question is the most frequent on the
list :) It stumped me... anyway try djbdns (it's different, but EZ and
secure), if you get stuck you can email me or join the discussion list
on http://kernel-panic.org where my questions are answered faster than I
can check my mail :)

BTW - the data file I first posted returns both the local and public
IPs to LAN requests. this would be better... only returns public IPs to
external requests.

### Client location conditional expressions
%LL:192.168
%LL:127
%EX

### SOA, NS and A definitions
.local:192.168.5.5:a:259200:LL
.168.192.in-addr.arpa:192.168.5.5:a:259200:LL
.domain.com:88.77.66.55:a:259200:EX
.66.77.88.in-addr.arpa:88.77.66.55:a:259200:EX

### PTR and A for LAN locals
=www.local:192.168.6.6:86400:LL
=mail.local:192.168.7.7:86400:LL

### PTR and A for Public
=www.domain.com:88.77.66.56:86400:EX
=mail.domain.com:88.77.66.57:86400:EX



// George

On Wed, Jun 12, 2002 at 09:48:00AM -0700, Michael Hudin wrote:
>So, there isn't any kind of aliasing or PREROUTING you can do for individual
>machines?  You couldn't take any requests to port 80 or 25 and FORWARD then
>to the outside interface? Wait, I guess not since a client is sending its
>request to the server on a port above 1024.
>
>I guess if this is the way it is, then that's that and I'll have to learn
>DNS a lot sooner than I had hoped.
>
>Hey is this in the FAQ or any of the site documentation anywhere?  If not, I
>do a lot of technical writing and would be more than happy to draft
>something up since apparently a lot of people have this problem.
>
>-michael
>
>----- Original Message -----
>From: "George Georgalis" <georgw@galis.org>
>To: <netfilter@lists.samba.org>
>Sent: Wednesday, June 12, 2002 8:58 AM
>Subject: Re: Internal machines can't resolve external addresses
>
>
>> Oops, forgot to mention the solution I'm using... which Ramin directed
>> me to :)
>>
>> DNS. I'm using tinydns/dnscache which answers LAN lookups with LAN IPs
>> and public lookups with public IPs. http://cr.yp.to/djbdns/install.html
>>
>> Here are relevant lines from my zone data file...
>>
>>
>> ### Client location conditional expressions
>> %LL:192.168
>> %LL:127
>>
>> ### SOA, NS and A definitions
>> .local:192.168.5.5:a:259200:LL
>> .168.192.in-addr.arpa:192.168.5.5:a:259200:LL
>> .domain.com:88.77.66.55:a:259200
>> .66.77.88.in-addr.arpa:88.77.66.55:a:259200
>>
>> ### PTR and A for LAN locals
>> =www.local:192.168.6.6:86400:LL
>> =mail.local:192.168.7.7:86400:LL
>>
>> ### PTR and A for Public
>> =www.domain.com:88.77.66.56:86400
>> =mail.domain.com:88.77.66.57:86400
>>
>>
>> (BTW - easier to configure than bind, eh? Not sure which Ramin
>> recommends.)
>>
>> // George
>>
>> On Wed, Jun 12, 2002 at 11:34:41AM -0400, George Georgalis wrote:
>> >The request gets the the public interface, then (presumably, depends on
>> >your rules) goes to the LAN server and is answered to the client IP,
>> >which is listening for the response from the public IP, no go.
>> >
>> >The LAN server needs to be be on a different subnet, so all traffic is
>> >routed through the router.
>> >
>> >You could remove the host route to the LAN, leaving only the route to
>> >the firewall, then you'll have the same problem if you access the LAN
>> >host via private IP.
>> >
>> >(Corrections welcome ;-)
>> >
>> >// George
>> >
>> >On Wed, Jun 12, 2002 at 10:07:55AM -0500, Glover George wrote:
>> >>Yes I've come across this problem MANY MANY times before, and would
>> >>appreciate it if someone could explain exactly why this doesn't work.
>> >>For instance.  I have 3 machines, a firewall/nat (linux), a linux
>> >>webserver and a windows machine behind it.  Now I am serving a website
>> >>that is on the webserver behind the firewall, and it's dns stuff is
>> >>somewhere out on the internet.  On my windows machine it resolves to the
>> >>public interface of the firewall.  Why doesn't packets destined for that
>> >>machine realize that they must be sent to the webserver instead of out
>> >>on the public interface? I know it's because the DNAT rule is on the
>> >>prerouting of the external nic, but why doesn't simply putting a DNAT
>> >>rule on the internal work as well?
>> >>
>> >>The only way for me to get this working is to run bind 9 and set up two
>> >>different views, to resolve different ip addresses whether you're on the
>> >>internet, or in my internal network.  But this is a hack, and everytime
>> >>I add someones website, I have to make changes to both views on the DNS
>> >>server to get it to work, for every host in that new domain.  It seems
>> >>like there should be an easier way, as I'm sure a LOT of people on this
>> >>list come across the same problem before.
>> >>
>> >>May not be possible with the current nat framework, but was just
>> >>wondering if someone could elaborate on it.  As always, thanks in
>> >>advance.
>> >>
>> >>Glover George
>> >>Systems/Networks Administrator
>> >>Gulf Sales & Supply, Inc.
>> >>dime@gulfsales.com
>> >>(228)-762-0268
>> >>
>> >>
>> >>-----Original Message-----
>> >>From: netfilter-admin@lists.samba.org
>> >>[mailto:netfilter-admin@lists.samba.org] On Behalf Of Matthew Hellman
>> >>Sent: Wednesday, June 12, 2002 7:30 AM
>> >>To: Michael Hudin; netfilter@lists.samba.org
>> >>Subject: Re: Internal machines can't resolve external addresses
>> >>
>> >>There is potentially another solution if you don't want to run your own
>> >>bind
>> >>server.  Add a third nic to your firewall and put these boxes in a DMZ.
>> >>Then you can use PREROUTING/DNAT.
>> >>
>> >>Goodluck,
>> >>Matt
>> >>
>> >>----- Original Message -----
>> >>From: "Michael Hudin" <hudin@zoetrope.com>
>> >>To: <netfilter@lists.samba.org>
>> >>Sent: Tuesday, June 11, 2002 10:00 PM
>> >>Subject: Internal machines can't resolve external addresses
>> >>
>> >>
>> >>Machines in the outside world, can view my websites fine, but whenever I
>> >>try
>> >>to go to one of them from a machine on my internal network behind the
>> >>firewall, neither the domain name nor the IP will resolve.  I also have
>> >>the
>> >>same problem with my mail server and have to use the internal address of
>> >>the
>> >>mail server.  I am going to guess that the best solution to this is to
>> >>run
>> >>some kind of local DNS server on the inside of the firewall which
>> >>resolves
>> >>all my sites internally, but since I don't have a server at my disposal
>> >>for
>> >>it, is there some way around this?  I had the POSTROUTING MASQ line on
>> >>and
>> >>that did allow the internal machines to resolve, but it also hid the
>> >>originating address for any outside machine, thus creating a security
>> >>disaster.
>> >>
>> >>-michael
>> >>
>> >>*nat
>> >>:PREROUTING ACCEPT [241:88600]
>> >>:POSTROUTING ACCEPT [0:9862]
>> >>:OUTPUT ACCEPT [68:4275]
>> >>-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 110 -j
>> >>DNAT --to-destination 192.168.77.2
>> >>-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 25 -j
>> >>DNAT --to-destination 192.168.77.2
>> >>-A PREROUTING -d 10.10.10.251 -p tcp -m tcp --dport 80 -j
>> >>DNAT --to-destination 192.168.77.2
>> >>-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 80 -j
>> >>DNAT --to-destination 192.168.77.2
>> >>-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 22 -j
>> >>DNAT --to-destination 192.168.77.2
>> >>-A POSTROUTING -o eth0 -j SNAT --to-source 10.10.10.254
>> >>#-A POSTROUTING -o eth1 -j MASQUERADE
>> >>COMMIT
>> >>
>> >>*mangle
>> >>:PREROUTING ACCEPT [18365:3221456]
>> >>:INPUT ACCEPT [10886:760348]
>> >>:FORWARD ACCEPT [7269:2438049]
>> >>:OUTPUT ACCEPT [8009:752540]
>> >>:POSTROUTING ACCEPT [15177:3182145]
>> >>COMMIT
>> >>
>> >>*filter
>> >>:INPUT ACCEPT [0:229546]
>> >>:FORWARD ACCEPT [363:1553786]
>> >>:OUTPUT ACCEPT [2:619341]
>> >>-A INPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
>> >>-A INPUT -p tcp -j ACCEPT
>> >>-A INPUT -p esp -j ACCEPT
>> >>-A INPUT -p ah -j ACCEPT
>> >>-A INPUT -i lo -j ACCEPT
>> >>-A FORWARD -i eth1 -j ACCEPT
>> >>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 110 -m state --state
>> >>NEW,RELATED,ESTABLISHED -j ACCEPT
>> >>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 25 -m state --state
>> >>NEW,RELATED,ESTABLISHED -j ACCEPT
>> >>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 80 -m state --state
>> >>NEW,RELATED,ESTABLISHED -j ACCEPT
>> >>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 22 -m state --state
>> >>NEW,RELATED,ESTABLISHED -j ACCEPT
>> >>-A OUTPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
>> >>-A OUTPUT -p tcp -j ACCEPT
>> >>-A OUTPUT -p esp -j ACCEPT
>> >>-A OUTPUT -p ah -j ACCEPT
>> >>-A OUTPUT -o lo -j ACCEPT
>> >>COMMIT
>> >>
>> >>
>> >>
>> >>
>> >>
>> >>
>> >>
>> >>
>> >
>> >--
>> >GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229
>> >Security Services, Web, Mail,            mailto:george@galis.org
>> >File, Print, DB and DNS Servers.       http://www.galis.org/george
>> >
>>
>> --
>> GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229
>> Security Services, Web, Mail,            mailto:george@galis.org
>> File, Print, DB and DNS Servers.       http://www.galis.org/george
>>
>>
>>
>>
>
>

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


