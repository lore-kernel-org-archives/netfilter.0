From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp forward to internal machine
Date: Tue, 4 Jun 2002 23:29:55 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042229.g54MTuA10411@Networker.rockstone.co.uk>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E79E7@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3A5DC36EC1506C40825C05BE65E62AEF0E79E7@neptuno.idea.com.mx>
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

On Tuesday 04 June 2002 11:24 pm, Omar Castaneda Acosta wrote:

> I've never included port 20 on my firewall rules and both passive and
> active ftp work fine.

Yeah, but I'll bet you're not translating the service to run on a weird port 
number, are you ?

You're almost certainly using "-m state --state RELATED" to handle port 20 
for you.   Isn't stateful inspection wonderful :-)


Antony

