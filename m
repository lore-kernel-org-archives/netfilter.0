From: "Filka Michal" <Michal.Filka@sitronicsts.com>
Subject: RE: simple question
Date: Wed, 23 May 2007 07:33:41 +0200
Message-ID: <2DD3CA89774593478BC28081C7392595BEC47B@exalfa.stromtelecom.cz>
References: <2DD3CA89774593478BC28081C7392595BEC225@exalfa.stromtelecom.cz>
	<da3a2a260705221120x3216601doee80f297904493a0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <da3a2a260705221120x3216601doee80f297904493a0@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I would like to somehow use conntrack's events for very simple
synchronization of two connection tracking tables. So, I need to know
what should be a reason for particular events. As far as I know there
are NEW, UPDATE and DESTROY events available. In case of UPDATE event
I'm not sure when it occurs ... So, when is UPDATE event issued?

Thanks,
Michal Filka


>=20
> I'm assuming that "update" originates from the idea of a database
> trigger. A trigger is an action performed after another action occurs.
> For example, when entering a new record, you could call a procedure to
> error check the formatting of the entry. Another example might be to
> add a record to a log table which logs the activity which occurs after
> a record is updated.
>=20
> I'd imagine that what you are talking about (update) is an event
> similar to a trigger. This means that the answer would depend on what
> the trigger is set for. Maybe it is when state is updated, or maybe it
> is when the configuration is updated. Maybe both.
>=20
> I have no idea to what you are referring or asking about, so beyond
> what I have detailed above, I cannot give you an aswer.
>=20
> Sorry.
>=20
> On 5/22/07, Filka Michal <Michal.Filka@sitronicsts.com> wrote:
> > Hi,
> >
> > Can anyone tell me what exactly means an update event. Of course, I
have
> > an idea, but I need to confirm it.
> >
> > So, does it mean that "state" attribute changed (E.g. connection
state,
> > counter, ... ), or is it related to a "configuration" attribute?
> >
> > Thanks,
> >
> > Michal Filka
> >
> >
> >
>=20
>=20
>=20
> --
> I thought about building you a boat to survive the river of tears I'm
> crying for you, but the world's smallest violins just aren't a
> reliable source of lumber, and that cross you're nailing yourself to
> seems buoyant enough anyways - Dr Gregory House, M.D.

