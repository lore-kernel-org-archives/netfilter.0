From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to use apache redirect with Iptables
Date: Thu, 13 Jun 2002 17:30:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131631.RAA08351@slate.rockstone.co.uk>
References: <1C3F31F94BAB1340A94AAC5CAFBA834708E64C@webmailsrv01.test.macam98.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1C3F31F94BAB1340A94AAC5CAFBA834708E64C@webmailsrv01.test.macam98.ac.il>
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
To: netfilter@lists.samba.org

On Wednesday 15 May 2002 4:04 pm, Nir Cohen wrote:

> Hello All
> I configure Iptables with 3 cards external,lan and dmz.
> I have 2 http servers in the dmz .Packets that coming in to port 80 I am
> doing DNAT to a 
 web server in the DMZ.I try to do apache redirect from
> this web server (in the httpd.conf -redirect option Redirect /
> http://192.168.1.3) to another web server
> in this segment but it is not working.

You must make sure that the redirect points to the *public* address of the 
other webserver, otherwise people will be contacting PublicServerA, which 
redirects them to PrivateServerB, and they can't route to a private address, 
so it fails.

If ServerA redirects them to PublicServerB then that is the second connection 
their browser will make and they will be able to connect.

 

Antony.

