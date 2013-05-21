From: Nick Khamis <symack@gmail.com>
Subject: Re: IPTables - Going Stateless
Date: Tue, 21 May 2013 12:11:19 -0400
Message-ID: <CAGWRaZZWwCT4NDS0Q__Xv=hYLhW65EjuDWpKGfRsL-2HJKfGTA@mail.gmail.com>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
	<201305211133.03830.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=bYFX+ZBnbVwO09PokHgrNtG4OMxalEGBI3s67KNeVO0=;
        b=MWJIYCUnHF8wR5S+f8UilPNGfroI1ZDXX8TQ0SF4AiwW8779pS8GmL1MnKQO3rHR5r
         VJTKxv6Yzyu5TWBpLBXMqpmVXIRa1GxHUSXxXQnXORPVlgabdp6mDKHrculYn6/5tlvh
         LSiahdY3A/SfBTmyKQ9dsWaQjn09Hee0qEagwyMey4+KJ/OjDOSaP9FQEA9LDSjJzALI
         W5DkpbJTfYTsHrWhxrcT1BlUOpLp5zIsviF74QpdIkvBh5O3kPwVOr4jViXytQOlu/3n
         imXHJaTl3B/AcmHGg/y7bYwmPgbTdDTyExvPZMOr9gzhVhmpbqxs8PN22JJVKDW4FQ3O
         rMAA==
In-Reply-To: <201305211133.03830.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello Neil, thank you so much for your response, For testing purposes
I changed the ssh rule to:

-A TCP -p tcp -m tcp --dport 22 -j ACCEPT
-A TCP -p tcp -m tcp -s 0.0.0.0/0 -d 192.168.2.5 --dport 22 -j DROP

And still no go. As mentioned before, everything works fine until I
try to close up the rest of the ports not opened up in the chains
"UDP" and "TCP" stated above:

#echo -e "       - Dropping input TCP and UDP traffic to closed ports"
-A INPUT -i $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
-A INPUT -i $INTIF1 -p udp -j REJECT --reject-with icmp-port-unreachable

#echo -e "       - Dropping output TCP and UDP traffic to closed ports"
-A OUTPUT -o $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
-A OUTPUT -o $INTIF1 -p udp -j REJECT --reject-with icmp-port-unreachable

#echo -e "       - Dropping input traffic to remaining protocols sent
to closed ports"
-A INPUT -i $INTIF1 -j REJECT --reject-with icmp-proto-unreachable

#echo -e "       - Dropping output traffic to remaining protocols sent
to closed ports"
-A OUTPUT -o $INTIF1 -j REJECT --reject-with icmp-proto-unreachable

That is when I cannot SSH over to the server.

N.
