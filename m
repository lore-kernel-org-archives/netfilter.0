From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: a discussion starter i hope.
Date: Thu, 13 Jun 2002 17:13:50 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131614.RAA08245@slate.rockstone.co.uk>
References: <1020975061.20151.16.camel@sarig.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1020975061.20151.16.camel@sarig.internal>
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

On Thursday 09 May 2002 9:11 pm, alan barrow wrote:

> Now behind the firewall are 2 separate servers, each running a web
> service and each running on port 80.
>
> 1) The question is, with only 1 real world address available to you,
> what suggestions do you guy's have as to the configuration required to
> make both web servers available on the Internet ? So that incoming port
> 80 request on the firewall public interface go to the correct server.

Which is the "correct server" ?

Are the two identical, and you want to do some sort of load balancing, or are 
they different, in which case what is the answer to the question "which is 
the correct server for packets coming in to this address" ?

> 2) The same as scenario 1) except you have 2 addresses available but
> only one external NIC.

No problem here - apply both external addresses to the NIC, have two 
translation rules forwarding packets from ExtAddrA to IntAddrA and ExtAddrB 
to IntAddrB.

> 3) Same as 2) except you have 2 NIC's.

Easy.   Take out one NIC and do what I suggested for question 2 above.

 

Antony.

