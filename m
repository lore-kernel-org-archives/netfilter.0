From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Quick Question
Date: Thu, 30 May 2002 22:03:56 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205302103.g4UL3wA21001@Networker.rockstone.co.uk>
References: <AIEOIGGABAHAAIOAILIDGEDFCGAA.matlas@vistainnovation.com> <200205302031.g4UKVnA19194@Networker.rockstone.co.uk> <20020530205455.GN29214@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020530205455.GN29214@cannon.eng.us.uu.net>
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

On Thursday 30 May 2002 9:54 pm, Ramin Alidousti wrote:

> There is a specialized case of Destination NAT called redirection: it is
> a simple convenience which is exactly equivalent to doing DNAT to the
> address of the incoming interface.

Oh.   So REDIRECT is a sort of "grab all packets and make it look like they 
were addressed to me" then ?   Like the opposite of MASQUERADE, really ?

(With an optional change to the port number along the way...)


Antony.

