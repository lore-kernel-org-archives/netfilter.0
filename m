From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 15:13:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111413.g8BEDtv08733@vulcan.rissington.net>
References: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv> <200209111248.g8BCmAv08513@vulcan.rissington.net> <20020911135903.GT7289@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020911135903.GT7289@cannon.eng.us.uu.net>
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

On Wednesday 11 September 2002 2:59 pm, Ramin Alidousti wrote:

> On Wed, Sep 11, 2002 at 01:48:04PM +0100, Antony Stone wrote:
>
> > Folks: don't try looking up the 5th layer of the TCP networking model :-)
>
> What's wrong with his statement? As Maciej said the 5th layer of the IP
> model is the application layer:
>
>                  --------------
>       layer 5   |  application |
>                  --------------
>       layer 4   |  TCP / UDP   |
>                  --------------
>       layer 3   |      IP      |
>                  --------------
>       layer 2   |  data link   |
>                  --------------
>       layer 1   |   physical   |
>                  --------------

I've never seen that diagram anywhere before.   It doesn't correspond to the 
TCP model, where layer 4 is the Application layer (Data link and Physical are 
combined into layer 1), and it doesn't correspond to the OSI model, where 
layer 7 is the Application layer (layer 5 is the Session layer and 6 is the 
Presentation layer).

> How many real networks do you know using the exact 7 layer OSI model?

I don't know - I hardly ever operate above the Transport layer myself :-)

The point I'm making is that in neither of the two standard networking 
models, the de facto TCP model, or the de jure OSI model, is layer 5 called 
Application.

I'd be fascinated to see a reference for that diagram of yours above - or is 
it the Alidousti Network Model ?

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

