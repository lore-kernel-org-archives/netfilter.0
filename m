From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 19:52:54 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627185257.SUCU19225.mta07-svc.ntlworld.com@there>
References: <20020627182753.GS31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627182753.GS31466@cannon.eng.us.uu.net>
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

On Thursday 27 June 2002 7:27 pm, Ramin Alidousti wrote:

> Hi,
>
> Does anyone have a good solution to catch the third (ACK) packet
> in a tcp connection setup?

Is the --ctstatus connection tracking extension any use ?   The value 
SEEN_REPLY will tell you when the second packet's come in, and ASSURED will 
match the third packet....

 

Antony.

