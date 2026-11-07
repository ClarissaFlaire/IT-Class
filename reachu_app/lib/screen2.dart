import 'package:flutter/material.dart';
// COMMUNITY CONTENT FOR EACH TOPIC

final Map<String, List<String>> topicSuggestions = {
  'Anxiety': [],
  'Depression': [],
  'OCD': [],
  'Loneliness': [],
  'Insecurity': [],
};

final Map<String, List<String>> topicMessages = {
  'Anxiety': [],
  'Depression': [],
  'OCD': [],
  'Loneliness': [],
  'Insecurity': [],
};


// DATA FOR EACH INFORMATION CARD
class TopicCardData {
  final String topic;
  final String title;
  final String description;

  const TopicCardData({
    required this.topic,
    required this.title,
    required this.description,
  });
}

// DASHBOARD PAGE
class DashboardPage extends StatefulWidget {
  final List<String> selectedTopics;

  const DashboardPage({
    super.key,
    required this.selectedTopics,
  });

  // INFORMATION CARDS
  static const List<TopicCardData> informationCards = [
    TopicCardData(
      topic: 'Anxiety',
      title: 'How to Deal with Anxiety',
      description:
          'Ground yourself and remind yourself of what is true.',
    ),
    TopicCardData(
      topic: 'Depression',
      title: 'How to Deal with Depression',
      description:
          'Find support and remember that difficult feelings can change.',
    ),
    TopicCardData(
      topic: 'OCD',
      title: 'Understanding OCD',
      description:
          'Learn about OCD and seek support from a qualified professional.',
    ),
    TopicCardData(
      topic: 'Loneliness',
      title: 'Coping with Loneliness',
      description:
          'Connect with others and seek social support.',
    ),
    TopicCardData(
      topic: 'Insecurity',
      title: 'Building Self-Confidence',
      description:
          'Challenge negative thoughts and practise self-compassion.',
    ),
  ];

  @override
  State<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  // CREATE FUNCTION
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // TOP BAR
      appBar: AppBar(
        title: const Text(
          'ReachU',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),

      // DASHBOARD CONTENT
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Your Dashboard',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Explore information on topics that matter to you.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 24),

    
          const SizedBox(height: 20),

          // DISPLAY INFORMATION CARDS
         ...DashboardPage.informationCards
    .where((card) => widget.selectedTopics.contains(card.topic))
    .map(
  (card) => InformationCard(
    card: card,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopicDetailPage(card: card),
        ),
      );
    },
  ),
),
        ],
      ),
    );
  }
}

// REUSABLE INFORMATION CARD DESIGN
class InformationCard extends StatelessWidget {
  final TopicCardData card;
  final VoidCallback onTap;

  const InformationCard({
    super.key,
    required this.card,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
     child: InkWell(
  onTap: onTap,
  borderRadius: BorderRadius.circular(16),
  child: Padding(
    padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOPIC LABEL
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                card.topic,
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // CARD TITLE
            Text(
              card.title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // INFORMATION TEXT
            Text(
              card.description,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey.shade800,
              ),
            ),
                   ],
        ),
      ),
    ),
    );
  }
}
class TopicDetailPage extends StatefulWidget {
  final TopicCardData card;

  const TopicDetailPage({
    super.key,
    required this.card,
  });

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  final TextEditingController _suggestionController =
      TextEditingController();

  final TextEditingController _messageController =
      TextEditingController();

  void _addSuggestion() {
    final text = _suggestionController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      topicSuggestions[widget.card.topic]!.add(text);
    });

    _suggestionController.clear();
  }

  void _addMessage() {
    final text = _messageController.text.trim();

    if (text.isEmpty) return;

    setState(() {
      topicMessages[widget.card.topic]!.add(text);
    });

    _messageController.clear();
  }

  @override
  void dispose() {
    _suggestionController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.card.topic),
      ),
      body: ListView(
  padding: const EdgeInsets.all(16),
  children: [
    Text(
      widget.card.title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 10),

    Text(
      widget.card.description,
      style: const TextStyle(fontSize: 16),
    ),

    const SizedBox(height: 12),

    const Text(
      'Community contributions reflect personal experiences '
      'and are not professional medical advice.',
      style: TextStyle(
        fontSize: 13,
        color: Colors.grey,
      ),
    ),

    const SizedBox(height: 28),

    const Text(
      'Community Coping Suggestions',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 12),

    TextField(
      controller: _suggestionController,
      decoration: const InputDecoration(
        hintText: 'Share a coping suggestion...',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    ),

    const SizedBox(height: 8),

    ElevatedButton(
      onPressed: _addSuggestion,
      child: const Text('Post Suggestion'),
    ),

    const SizedBox(height: 12),

    StickyNoteBoard(
  notes: topicSuggestions[widget.card.topic]!,
  onDelete: (index) {
    setState(() {
      topicSuggestions[widget.card.topic]!.removeAt(index);
    });
  },
),

    const SizedBox(height: 28),

    const Text(
      'Community Encouraging Messages',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 12),

    TextField(
      controller: _messageController,
      decoration: const InputDecoration(
        hintText: 'Share an encouraging message...',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    ),

    const SizedBox(height: 8),

    ElevatedButton(
      onPressed: _addMessage,
      child: const Text('Post Message'),
    ),

    const SizedBox(height: 12),

    StickyNoteBoard(
  notes: topicMessages[widget.card.topic]!,
  onDelete: (index) {
    setState(() {
      topicMessages[widget.card.topic]!.removeAt(index);
    });
  },
),
  ],
),
    );
  }
}
class StickyNote extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onDelete;
  final double rotation;

  const StickyNote({
    super.key,
    required this.text,
    required this.color,
    required this.onDelete,
    required this.rotation,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation,
      child: Container(
        width: 180,
        constraints: const BoxConstraints(
          minHeight: 150,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           SizedBox(
  height: 90,
  width: double.infinity,
  child: Align(
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        height: 1.4,
        color: Colors.black87,
      ),
    ),
  ),
),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                size: 19,
              ),
              tooltip: 'Delete note',
            ),
          ],
        ),
      ),
    );
  }
}

class StickyNoteBoard extends StatelessWidget {
  final List<String> notes;
  final Function(int) onDelete;

  const StickyNoteBoard({
    super.key,
    required this.notes,
    required this.onDelete,
  });

  final List<Color> noteColors = const [
    Color(0xFFFFF3A6),
    Color(0xFFFFD6E0),
    Color(0xFFD5F5E3),
    Color(0xFFD6E8FF),
    Color(0xFFE8D7FF),
    Color(0xFFFFE0BD),
  ];

  final List<double> rotations = const [
    -0.035,
    0.025,
    -0.02,
    0.04,
    -0.03,
    0.015,
  ];

  @override
  Widget build(BuildContext context) {
    const double spacingX = 230;
    const double spacingY = 220;
    const int columns = 6;

    final int rows = (notes.length / columns).ceil();

    final double boardHeight =
        (rows * spacingY + 250).clamp(1400, double.infinity);

    return SizedBox(
      height: 500,
     
        child: SizedBox(
          width: 1600,
          height: boardHeight,
          child: Stack(
            children: List.generate(notes.length, (index) {
              final int column = index % columns;
              final int row = index ~/ columns;

              return Positioned(
                left: 30 + column * spacingX,
                top: 30 + row * spacingY,
                child: StickyNote(
                  text: notes[index],
                  color: noteColors[index % noteColors.length],
                  rotation: rotations[index % rotations.length],
                  onDelete: () => onDelete(index),
                ),
              );
                      }),
          ),
        ),
    );
  }
}