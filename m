From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Fri, 23 Apr 2004 12:17:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040423101739.GA1280@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk> <20040420205144.GC2997@rie.rie.priv> <003c01c4271e$ffbe9a00$68892090@grouse> <20040421111445.GA892@rie.rie.priv> <00e301c427b7$0ed49dd0$68892090@grouse> <20040421195154.GA1367@rie.rie.priv> <025901c427ee$6d883800$68892090@grouse> <20040422204157.GA1993@rie.rie.priv> <006a01c428b1$a99c1f00$68892090@grouse>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006a01c428b1$a99c1f00$68892090@grouse>
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
Content-Transfer-Encoding: 7bit
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org

Hello Jee,

On 2004-04-22 22:34:59 +0100, Jee J.Z. wrote:
> >
> > In my opinion the surplus bytes are not more part of the packet, because
> > I gave the new length as parameter of the ipq_set_verdict call. I do not
> > know any other method to get rid of them. Do you have an idea?
> > The fact that the surplus bytes are partly the same as of the original
> > packet can be explined: My program strips the IP, UDP and some
> > encapsulation bytes.
> 
> I would guess there could be some misoperation on your memory. I don't
> understand why stripping the IP, UDP and some encapsulation bytes result in
> these duplicated surplus bytes.

Nobody is perfect, but for the moment I did not find the error.(:=((

> 
> It should not be hard to get rid of these constant bytes. Just find out
> where they are in your memory, get rid of them  -- put all your useful bytes
> in a consecutive memory block (if these surplus bytes are not the end of the
> packet), or double check and confirm the length of useful bytes (as data_len
> in ipq_set_verdict()) if these surplus bytes are the end of the packet.

To a certain extent my code does this: 
After finding out that the inner packet has to be accepted I set the
char *buf parameter of the verdict call to the beginning of inner packet,
the size_t data_len parameter is set to length of the inner packet.
Therefore it seems to me that the verdict call copies the inner packet
to the beginning of the captured packet.

> 
> BTW, Did you copy all the packet content into userspace by setting
> IPQ_COPY_PACKET in ipq_set_mode function?

Yes!

> 
> > >
> > > > For your info I attach a file including the commented sequence of the
> > > > packet flow from sender to receiver.
> > >
> > > As you know, TCP, UDP, and ICMP checksums are calculated based on both
> their
> > > header and their payload, unlike IP. Therefore, these additional bytes
> in
> > > your trace may result in the checksum calculation incorrectness. I
> assume
> > > you don't have these additional bytes when you tested on UDP and ICMP
> > > packets.
> >
> > No, in both cases they are there, but that has no bad effect. Therefore
> > my assumption that the calculation of the TCP checksum includes all
> > remaining bytes at the end.
> 
> Sounds strange. TCP checksum does include all its payload data. However, UDP
> and ICMP do so as well. The only possibility I can see is when you test on
> UDP and ICMP packets, the system doesn't think the surplus bytes are part of
> the packets; instead, the system may think they the packet trailer. But when
> you test on TCP packets, the system thinks the surplus bytes are part of the
> packets, and therefore the checksum is not correct. Did you change the
> header length field and total length field in IP header?

I agree completely to your assumption or interpretation. Unfortunately I
am not so familiar with the kernel, therefore I have not yet analyzed
the TCP code for incomming packets.
As pointed out above, I do not change anything within the inner packet.

> 
> > On the other hand, I do not understand why after the verdict call the
> > packet holds the surplus bytes. Maybe this should be fixed?
> 
> To test, try shorten the data_len parameter in ipq_set_verdict() and see
> whether they are still there.

As mentioned above, this is exactly what I do.

> 
> I am looking forward to your result.

It seems to me I have to learn why verdict does not reduce the packet
size and how the kernel handles incomming TCP packets concerning
checksumming. If you have further ideas, please mail them.
Nevertheless I have set up a bug report, hoping that one of the
core group can solve the problem.

Regards

Christian
-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany

