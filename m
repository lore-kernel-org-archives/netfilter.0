From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Could be a stupid question...
Date: Mon, 17 May 2004 11:08:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405171108.44780.Antony@Soft-Solutions.co.uk>
References: <200405172155.06592.dennis@airstrike.co.nz>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405172155.06592.dennis@airstrike.co.nz>
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
To: netfilter@lists.netfilter.org

On Monday 17 May 2004 10:55 am, Dennis Morgan wrote:

> Hi All...
> I am just writing to know if there is a way to BLOCK certain types of
> requests getting to to the webserver?
>
> at present i am getting alot of problems with people using SEARCH requests
>
> ie SEARCH / and a load of escape characters trying to get unauthorised
> access. I would like to know if there is a way with netfilter to drop these
> packets?

No.   This is an OSI layer 7 (application) problem - you cannot solve it using 
an OSI layer 3/4 (packet filter) solution.

Look into an HTTP proxy server such as Squid.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


